import java.awt.*;
import java.awt.event.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.*;
import java.awt.event.WindowListener;
import java.awt.event.WindowEvent;
class StudentLog extends Frame implements ActionListener, WindowListener{
	private SmsPage1 p1;
	TextField tf1;
	private TextField tf2;
	public StudentLog(SmsPage1 f){
		super("Student Management System, Student Log In");
		p1=f;
		Label l1=new Label("Student ID");
		Label l2=new Label("Password");
		TextField tf1=new TextField(20);
		TextField tf2=new TextField(20);
		Button b1=new Button("Login");
		Button b2=new Button("Cancel");
		
		add(l1);
		add(tf1); 
		tf1.addActionListener(new ActionListener() 
								{public void actionPerformed(ActionEvent e)
									{ 
										if(tf1.getText().isEmpty())
											JOptionPane.showMessageDialog(null,"Enter ID");
		
									}
								}
							 );
		add(l2);
		add(tf2);
		tf2.addActionListener(new ActionListener() 
								{public void actionPerformed(ActionEvent e)
									{ 
										if(tf1.getText().isEmpty() && tf2.getText().isEmpty())
											JOptionPane.showMessageDialog(null,"Enter ID and Password");
										else if(tf2.getText().isEmpty())
											JOptionPane.showMessageDialog(null,"Enter Password Please!");
										else if(tf1.getText().isEmpty())
											JOptionPane.showMessageDialog(null,"Enter ID Please!");
		
									}
								}
							 ); 
		add(b1);
		add(b2);
		b1.addActionListener(this);
		b2.addActionListener(this);
		this.addWindowListener(this);
		setBounds(400,150,550,450);
		setLayout(new FlowLayout());
		setVisible(true);
	}
	public void actionPerformed(ActionEvent ae){
		String s=ae.getActionCommand();	
		if(s.equals("Login"))
		{
			if(tf1.getText().isEmpty() && tf2.getText().isEmpty())
				JOptionPane.showMessageDialog(null,"Enter ID and Password");
			else if(tf2.getText().isEmpty())
				JOptionPane.showMessageDialog(null,"Enter Password Please!");
			else if(tf1.getText().isEmpty())
				JOptionPane.showMessageDialog(null,"Enter ID Please!");
			else
				{
					DataAccess da=new DataAccess();
					String typedName=tf1.getText();
					String typedPass=tf2.getText();
					String q="select sId, sPassword from student";
					ResultSet rs=null;	
				try
					{
						rs=da.getData(q);
						while(rs.next())
							{
								String un = rs.getString("sId");
								String sp= rs.getString("sPassword");
								if(un.equals(typedName) && sp.equals(typedPass))
									{
										JOptionPane.showMessageDialog(this,"Welcome");
					
									}
								else
									JOptionPane.showMessageDialog(this,"Invalid ID or Password, Try again.");
							}
					}
				catch(Exception ex)
					{
						JOptionPane.showMessageDialog(this,"Database Error");
						//ex.printStackTrace();
					}		
				}
		}
		else if(s.equals("Cancel"))
		{
			p1.setVisible(true);
			this.setVisible(false);
		}
	}
	public void windowActivated(WindowEvent e){}
	public void windowClosed(WindowEvent e){}
	public void windowClosing(WindowEvent e){
		System.exit(0);
	}
	public void windowDeactivated(WindowEvent e){}
	public void windowDeiconified(WindowEvent e){}
	public void windowIconified(WindowEvent e){}
	public void windowOpened(WindowEvent e){}
}