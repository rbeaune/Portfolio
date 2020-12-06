/*
 Program: Project_Books: BooksView
 Author: Raymond Beaune
 */

import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;

public class BooksView extends JFrame {
	
	//Components
	//For output
	public JButton btnOutAllBooks = new JButton("All Books");
	public JButton btnOutAllOnLoan = new JButton("All Books on Loan");
	public JButton btnOutAllBorrow = new JButton("All Borrowers");
	public JButton btnOutAllOverdue = new JButton("All Books Overdue");
	public JButton btnOutSubject = new JButton("Retrieve");
	public JButton btnOutAuthor = new JButton("Retrieve");
	private JLabel lblOutBySubject = new JLabel("Books by Subject:");
	private JLabel lblOutByAuthor = new JLabel("Books by Author:");
	public JTextField txtOutBySubject = new JTextField();
	public JTextField txtOutByAuthor = new JTextField();
	
	//For Input
	public JButton btnInAuthor = new JButton("New Author");
	public JButton btnInBook = new JButton("New Book");
	public JButton btnInBorrower = new JButton ("New Borrower");
	public JButton btnInLoan = new JButton("New Loan");
	
	//Constructor
	public BooksView() {
		
		//Main frame
		super ("Raymond Beaune's Books Project");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setLayout(new BorderLayout());
		this.setSize(400,350);
		this.setLocationRelativeTo(null);
		this.setResizable(false);
		Border margin = new EmptyBorder(15,15,15,15); //for padding
		
		//dataOut1 - Quick Data Retrieval
		JPanel dataOut1 = new JPanel();
		dataOut1.setLayout(new GridLayout(2,2));
		dataOut1.setBorder(new CompoundBorder(new TitledBorder("Quick Data Retrieval"), margin));
		//Components for dataOut1
		dataOut1.add(btnOutAllBooks);
		dataOut1.add(btnOutAllBorrow);
		dataOut1.add(btnOutAllOnLoan);
		dataOut1.add(btnOutAllOverdue);
		this.add(dataOut1, BorderLayout.NORTH);
		
		//dataOut2 - Refined Data Retrieval
		JPanel dataOut2 = new JPanel();
		dataOut2.setLayout(new GridLayout(2,3));
		dataOut2.setBorder(new CompoundBorder(new TitledBorder("Refined Data Retrieval"), margin));
		//Components for dataOut2
		dataOut2.add(lblOutByAuthor);
		dataOut2.add(txtOutByAuthor);
		dataOut2.add(btnOutAuthor);
		dataOut2.add(lblOutBySubject);
		dataOut2.add(txtOutBySubject);
		dataOut2.add(btnOutSubject);
		this.add(dataOut2, BorderLayout.CENTER);
				
		//dataIn - Data Input
		JPanel dataIn = new JPanel();
		dataIn.setLayout(new GridLayout(2,2));
		dataIn.setBorder(new CompoundBorder(new TitledBorder("Data Input"), margin));
		//Components for dataIn
		dataIn.add(btnInAuthor);
		dataIn.add(btnInBorrower);
		dataIn.add(btnInBook);
		dataIn.add(btnInLoan);
		this.add(dataIn, BorderLayout.SOUTH);
		
	}
	
	//Method to set the listener
	public void addDataRetrievalListener(ActionListener btnListener) {
		
		btnOutAllBooks.addActionListener(btnListener);
	}
}
