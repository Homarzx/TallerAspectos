import java.util.Calendar;
import java.io.File;

public aspect Logger {
	
	

	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
	    	System.out.println("**** User created ****");
	    }
	    
	    
	    
	   

}
