package main;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Main {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Ventana con botones");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 200);
        frame.setLayout(new FlowLayout());

        JButton button1 = new JButton("Botón 1");
        JButton button2 = new JButton("Botón 2");
        JButton button3 = new JButton("Botón 3");

        button1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                frame.getContentPane().setBackground(Color.RED);
            }
        });

        button2.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                frame.getContentPane().setBackground(Color.GREEN);
            }
        });

        button3.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                frame.getContentPane().setBackground(Color.BLUE);
            }
        });

        frame.add(button1);
        frame.add(button2);
        frame.add(button3);

        frame.setVisible(true);
    }
}
