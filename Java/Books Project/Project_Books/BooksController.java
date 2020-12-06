/*
 Program: Project_Books: BooksController
 Author: Raymond Beaune
 */

import java.sql.*;
import java.awt.event.*;
import javax.swing.table.TableModel;

public class BooksController {
	
	private BooksView theView;
	private DbUtils theModel;
	
	//Connection strings
	private String url = "jdbc:mysql://localhost:3306/info5051_books";
	private String user = "root";
	private String pass = "password";
	
	//Connection objects
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rslt = null;
	private PreparedStatement prepStmt = null;
	
	//Constructor
	public BooksController (BooksView view, DbUtils model)
	{
		this.theView = view;
		this.theModel = model;
		
		this.theView.addDataRetrievalListener(new DataRetrievalListener());
	}
	
	private class DataRetrievalListener implements ActionListener {
		
		public void actionPerformed (ActionEvent ev){
			
			try {
				conn = DriverManager.getConnection(url, user, pass);
				prepStmt = conn.prepareStatement("SELECT * FROM ?");
				
				if (ev.getSource().equals(theView.btnOutAllBooks))
					prepStmt.setString(1, "Book");
				else if (ev.getSource().equals(theView.btnOutAllBorrow))
					prepStmt.setString(1, "Borrower");
				else if (ev.getSource().equals(theView.btnOutAllOnLoan))
					prepStmt.setString(1, "Book_Loan");
				else if (ev.getSource().equals(theView.btnOutAllOverdue))
					prepStmt.setString(1, "");
				
				rslt = prepStmt.executeQuery();
				TableModel tModel = DbUtils.resultSetToTableModel(rslt);
				new TableView(tModel);
			}
			catch (Exception e) {
				System.out.println("Error: " + e);
			}
			finally {
				//Attempt to close the connections
				try {
					if(rslt != null)
						rslt.close();
					if(stmt != null)
						stmt.close();
					if(conn != null)
						conn.close();	
				}
				catch (SQLException sqle) {
					System.out.println("SQLError: " + sqle);
				}
			}
		}
	}
}
