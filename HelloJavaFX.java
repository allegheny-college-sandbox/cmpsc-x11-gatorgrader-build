import javafx.application.Application;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.stage.Stage;

public class HelloJavaFX extends Application {
  
  public void start(Stage primaryStage) {
    Text hello = new Text(50,50,"Hello, JavaFX!");
    Group root = new Group(hello);
    Scene scene = new Scene(root,300,120,Color.LIGHTGREEN);
    primaryStage.setTitle("WHAT UP");
    primaryStage.setScene(scene);
    primaryStage.show();
  }
  
  public static void main(String[] args) {
    launch(args);
  }
}