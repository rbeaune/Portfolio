/*
 Program: Project_Books: TableView
 Author: Raymond Beaune
 */

import javax.swing.*;
import java.awt.*;
import javax.swing.table.TableModel;


public class TableView extends JFrame
{
	//constructor
	public TableView(TableModel model)
	{
		super("Using a JTable to view a Result Set");
		
		//boilerplate
		this.setLayout(new FlowLayout() );
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setSize(700,600);
		this.setLocationRelativeTo(null);

		JTable table = new JTable(model);
		
		JScrollPane scrollPane = new JScrollPane(table);		
		this.add(scrollPane);
		
		this.setVisible(true);
		
	}
}