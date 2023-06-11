package main;

import javax.swing.*;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.List;

public aspect ColorChangeObserver {
    private List<ColorChangeListener> observers = new ArrayList<>();
    private Color currentColor;

    pointcut frameInit(JComponent frame): execution(javax.swing.JFrame+.new(..)) && target(frame);

    after(JComponent frame): frameInit(frame) {
        addObserver(new ColorChangeConsoleObserver());
    }

    pointcut buttonClick(AbstractButton button): execution(void AbstractButton.addActionListener(ActionListener)) && target(button);

    after(AbstractButton button, ActionEvent event): buttonClick(button) && args(listener) && this(event) {
        if (event.getSource() instanceof Color) {
            currentColor = (Color) event.getSource();
            notifyObservers();
        }
    }

    private void addObserver(ColorChangeListener observer) {
        observers.add(observer);
    }

    private void notifyObservers() {
        for (ColorChangeListener observer : observers) {
            observer.updateColor(currentColor);
        }
    }
}
