package main;

import java.awt.Color;

public class ColorChangeConsoleObserver implements ColorChangeListener {
    @Override
    public void updateColor(Color color) {
        System.out.println("Nuevo color de fondo: " + color);
    }
}