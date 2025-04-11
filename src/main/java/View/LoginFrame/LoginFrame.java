package View.LoginFrame;

import View.LoginComponent.RoundedPanel;
import View.LoginComponent.RoundedButton;
import View.LoginComponent.RoundedPasswordField;
import View.LoginComponent.RoundedTextField;

import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.util.Objects;
import javax.imageio.ImageIO;

public class LoginFrame extends JFrame {
    private JPanel loginPanel;
    private JLabel imageLabel;
    private Image originalImage;

    public LoginFrame() {
        setTitle("Login Frame");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1280, 720); 
        setLocationRelativeTo(null);
        setResizable(false); // Lock window size

        setLayout(new BorderLayout());

        loginPanel = new RoundedPanel(15);
        loginPanel.setLayout(null); 
        loginPanel.setBackground(Color.WHITE);
        loginPanel.setPreferredSize(new Dimension(400, 720));

        JLabel titleLabel = new JLabel("WELCOME!");
        titleLabel.setFont(new Font("Arial", Font.BOLD, 24));
        titleLabel.setForeground(new Color(70, 70, 70));
        titleLabel.setBounds(120, 220, 200, 30);
        loginPanel.add(titleLabel);

        JTextField usernameField = new RoundedTextField("Username"); 
        usernameField.setBounds(70, 290, 240, 40);
        usernameField.setBorder(BorderFactory.createEmptyBorder(5, 10, 5, 10));
        loginPanel.add(usernameField);

        RoundedPasswordField passwordField = new RoundedPasswordField("Password");
        passwordField.setBounds(70, 350, 240, 40);
        passwordField.setBorder(BorderFactory.createEmptyBorder(5, 10, 5, 10));
        loginPanel.add(passwordField);

        JLabel guestLabel = new JLabel("Login as guest? Click here!");
        guestLabel.setFont(new Font("Arial", Font.PLAIN, 12));
        guestLabel.setForeground(new Color(100, 100, 100));
        guestLabel.setBounds(95, 410, 200, 20);
        loginPanel.add(guestLabel);

        JButton loginButton = new RoundedButton("LOGIN");
        loginButton.setBounds(120, 450, 140, 40);
        loginButton.setBackground(new Color(200, 200, 200));
        loginButton.setFocusPainted(false);
        loginButton.setBorderPainted(false);
        loginPanel.add(loginButton);

        add(loginPanel, BorderLayout.WEST);

        JPanel imagePanel = new JPanel(new BorderLayout());
        imagePanel.setBackground(Color.BLACK);
        imagePanel.setPreferredSize(new Dimension(880, 720));

        imageLabel = new JLabel();
        imageLabel.setHorizontalAlignment(JLabel.CENTER);
        imageLabel.setVerticalAlignment(JLabel.CENTER);

        try {
            originalImage = ImageIO.read(Objects.requireNonNull(getClass().getResource("/Images/image.jpg")));
            Image scaledImage = originalImage.getScaledInstance(880, 720, Image.SCALE_SMOOTH);
            imageLabel.setIcon(new ImageIcon(scaledImage));
        } catch (IOException | NullPointerException e) {
            System.out.println("Could not load image: " + e.getMessage());
            imageLabel.setText("Image not found");
        }
        
        imagePanel.add(imageLabel, BorderLayout.CENTER);
        add(imagePanel, BorderLayout.CENTER);

        setVisible(true);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(LoginFrame::new);
    }
}