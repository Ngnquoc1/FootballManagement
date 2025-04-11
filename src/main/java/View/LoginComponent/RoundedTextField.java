package View.LoginComponent;

import javax.swing.*;
import java.awt.*;
public class RoundedTextField extends JTextField {
    private int cornerRadius = 15;
    private String placeholder;
    
    public RoundedTextField(String placeholder) {
        super();
        this.placeholder = placeholder;
        setOpaque(false);
        setBackground(new Color(200, 255, 200));
        setForeground(Color.GRAY); // Default placeholder color
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2 = (Graphics2D) g.create();
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        // Paint background
        g2.setColor(getBackground());
        g2.fillRoundRect(0, 0, getWidth()-1, getHeight()-1, cornerRadius, cornerRadius);
        
        super.paintComponent(g2);
        

        if (getText().isEmpty() && !hasFocus()) {
            g2.setColor(new Color(100, 100, 100, 150)); 
            g2.setFont(getFont().deriveFont(Font.ITALIC));
            FontMetrics fm = g2.getFontMetrics();
            int y = (getHeight() - fm.getHeight()) / 2 + fm.getAscent();
            g2.drawString(placeholder, 10, y); 
        }
        
        g2.dispose();
    }
}