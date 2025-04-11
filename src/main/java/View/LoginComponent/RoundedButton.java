package View.LoginComponent;/* RoundedButton.java - For rounded buttons */
import javax.swing.*;
import java.awt.*;
public class RoundedButton extends JButton {
    private int cornerRadius = 10;
    
    public RoundedButton(String text) {
        super(text);
        setOpaque(false);
        setContentAreaFilled(false);
        setFocusPainted(false);
        setBorderPainted(false);
    }
    
    @Override
    protected void paintComponent(Graphics g) {
        Graphics2D g2 = (Graphics2D) g.create();
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        
        if (getModel().isPressed()) {
            g2.setColor(Color.LIGHT_GRAY);
        } else if (getModel().isRollover()) {
            g2.setColor(new Color(220, 220, 220));
        } else {
            g2.setColor(Color.LIGHT_GRAY);
        }
        
        g2.fillRoundRect(0, 0, getWidth(), getHeight(), cornerRadius, cornerRadius);
        
        super.paintComponent(g2);
        g2.dispose();
    }
}