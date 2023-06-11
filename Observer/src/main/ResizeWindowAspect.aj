package main;

import java.util.ArrayList;
import java.util.List;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public aspect ResizeWindowAspect {
    private List<WindowResizeListener> observers = new ArrayList<>();
    private Dimension currentSize;

    pointcut frameInit(JComponent frame): execution(javax.swing.JFrame+.new(..)) && target(frame);

    after(JComponent frame): frameInit(frame) {
        addObserver(new WindowResizeConsoleObserver());
    }

    pointcut buttonClick(AbstractButton button): execution(void AbstractButton.addActionListener(ActionListener)) && target(button);

    after(AbstractButton button, ActionEvent event): buttonClick(button) && args(listener) && this(event) {
        if (event.getSource() instanceof Dimension) {
            currentSize = (Dimension) event.getSource();
            resizeWindow();
        }
    }

    private void addObserver(WindowResizeListener observer) {
        observers.add(observer);
    }

    private void resizeWindow() {
        for (WindowResizeListener observer : observers) {
            observer.updateWindowSize(currentSize);
        }
    }

    public void notifySizeChange(Dimension size) {
        currentSize = size;
        resizeWindow();
    }
}
