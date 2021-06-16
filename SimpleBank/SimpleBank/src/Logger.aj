import java.util.Calendar;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public aspect Logger {
	
	

	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
	    	System.out.println("**** User created ****");
	    }
	    
	    
	    File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
	    
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut retirar() : call(* moneyWithdrawal*(..) );
	    after() : retirar() {
	    	String st = "Retira dinero: "+cal.getTime();
	    	System.out.println(st);
	    	FileWriter fw;
			try {
				fw = new FileWriter("log.txt");
				fw.write(st);
		    	fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
}
