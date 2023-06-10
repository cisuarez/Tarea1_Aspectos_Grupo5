package com.pooespol.ds_tarea1_aspectos;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.layout.HBox;

/**
 * FXML Controller class
 *
 * @author ASUS
 */
public class ControladorController implements Initializable {

    @FXML
    public HBox root;
    @FXML
    public Button boton1;
    @FXML
    public Button boton2;
    @FXML
    public Button boton3;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        CambiarColorVentana();

    }

    public void CambiarColorVentana() {
        boton1.addEventHandler(ActionEvent.ACTION, (ActionEvent t) -> {
            root.setStyle("-fx-background-color:red;");
            System.out.println("ROJO");
           
        });
        boton2.addEventHandler(ActionEvent.ACTION, (ActionEvent t) -> {
            root.setStyle("-fx-background-color:green;");
            System.out.println("VERDE");
        });
        boton3.addEventHandler(ActionEvent.ACTION, (ActionEvent t) -> {
            root.setStyle("-fx-background-color:yellow;");
            System.out.println("AMARILLO");
        });

    }

}
