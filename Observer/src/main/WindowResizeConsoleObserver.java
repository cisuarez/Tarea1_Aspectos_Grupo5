package main;

import java.awt.Dimension;

public class WindowResizeConsoleObserver implements WindowResizeListener {
    @Override
    public void updateWindowSize(Dimension size) {
        System.out.println("Tamaño de ventana actualizado: " + size);
    }
}