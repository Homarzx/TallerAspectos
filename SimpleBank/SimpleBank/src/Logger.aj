import java.util.Calendar;
import java.io.*;

public aspect Logger {
	
	

	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
	    	System.out.println("**** User created ****");
	    }
	    
	    //File file = new File("log.txt");
	    //FileWriter w=new FileWriter("log.txt");    		
	    BufferedWriter bw = new BufferedWriter(new FileWriter("log.txt"));
	    Calendar cal = Calendar.getInstance();
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut success2() : call(* moneyMakeTransaction(..) );
	    after() : success2() {
	    	System.out.println("Realiza transaccion"+" "+cal.getTime());
	    	try {
				bw.write("Realiza transaccion"+" "+cal.getTime());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	   

}
