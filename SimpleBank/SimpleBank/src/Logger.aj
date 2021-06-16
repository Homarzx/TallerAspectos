import java.util.Calendar;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.*;

public aspect Logger {

	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
	    	System.out.println("**** User created ****");
	    }	    
	    
	    File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
	   
	    BufferedWriter bw;
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut success2() : call(* moneyMakeTransaction(..) );
	    after() : success2() {
	    	System.out.println("Realiza transaccion"+" "+cal.getTime());
	    	try {
	    		bw = new BufferedWriter(new FileWriter("log.txt"));
				bw.write("Realiza transaccion"+" "+cal.getTime());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	    
	    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
	    pointcut retirar() : call(* moneyWithdrawal*(..) );
	    after() : retirar() {
	    	String st = "Retira dinero: "+cal.getTime();
	    	System.out.println(st);
	    	FileWriter fw;
			try {
				fw = new FileWriter("log.txt");
				fw.write(st + "\n");
		    	fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
}
