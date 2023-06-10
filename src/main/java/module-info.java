module com.pooespol.ds_tarea1_aspectos {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.base;

    opens com.pooespol.ds_tarea1_aspectos to javafx.fxml;
    exports com.pooespol.ds_tarea1_aspectos;
}
