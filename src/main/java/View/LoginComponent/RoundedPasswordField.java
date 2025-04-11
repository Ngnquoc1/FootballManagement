package View.LoginComponent;

import javax.swing.*;
import java.awt.*;

public class RoundedPasswordField extends JPasswordField {
    private int cornerRadius = 15;
    private String placeholder;
    
    public RoundedPasswordField(String placeholder) {
        super();
        this.placeholder = placeholder;
        setOpaque(false);
        setBackground(new Color(200, 255, 200));
        setForeground(Color.GRAY);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2 = (Graphics2D) g.create();
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setColor(getBackground());
        g2.fillRoundRect(0, 0, getWidth()-1, getHeight()-1, cornerRadius, cornerRadius);
        
        super.paintComponent(g2);
        

        if (getPassword().length == 0 && !hasFocus()) {
            g2.setColor(new Color(100, 100, 100, 150));
            g2.setFont(getFont().deriveFont(Font.ITALIC));
            FontMetrics fm = g2.getFontMetrics();
            int y = (getHeight() - fm.getHeight()) / 2 + fm.getAscent();
            g2.drawString(placeholder, 10, y); 
        }
        
        g2.dispose();
    }
}