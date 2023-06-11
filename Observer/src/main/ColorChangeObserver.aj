package main;

public aspect ColorChangeObserver {
    private ColorChangeObservable observable;

    pointcut buttonClick(): execution(void javax.swing.AbstractButton.addActionListener(ActionListener+)) && target(button) && args(listener);

    after(Object newValue): buttonClick() && if(observable != null) && newValue != null {
        observable.notifyColorChange(newValue.toString());
    }

    pointcut frameInit(): execution(javax.swing.JFrame+.new()) && this(frame);

    after(): frameInit() {
        observable = new ColorChangeObservable();
        observable.addObserver(new ColorChangeConsoleObserver());
    }
}

class ColorChangeObservable {
    private List<ColorChangeObserver> observers;

    public ColorChangeObservable() {
        observers = new ArrayList<>();
    }

    public void addObserver(ColorChangeObserver observer) {
        observers.add(observer);
    }

    public void notifyColorChange(String color) {
        for (ColorChangeObserver observer : observers) {
            observer.update(color);
        }
    }
}

interface ColorChangeObserver {
    void update(String color);
}

class ColorChangeConsoleObserver implements ColorChangeObserver {
    public void update(String color) {
        System.out.println("Nuevo color de fondo: " + color);
    }
}