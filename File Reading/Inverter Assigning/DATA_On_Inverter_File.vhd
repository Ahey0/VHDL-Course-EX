Library IEEE;
use IEEE.std_Logic_1164.all;
Use work.basic_utilities.all;
Entity DATA_On_Inverter_File Is
END ENTITY;
Architecture DATA_On_Inverter_File_Behave OF DATA_On_Inverter_File  IS
procedure assign_qits (
          Signal S  : OUT qIT   ;
          file_name : In String ;
          period    : In Time   
                      ) IS
    Variable char    : Character    ;         
    Variable current : Time := 0 ns ;
    file input_value_file : logic_data is 
"C:\Users\NSB\Documents\U\7\VHDL\Exercises\Codes\File Reading\Inverter Assigning/DATA_OUT.txt";
Begin
     File_Open(input_value_file,file_name,READ_MODE);
       While Not ENDFILE (input_value_file) Loop
             Read (input_value_file,char); 
                current:=current + period;
                case Char is
                    when '0' =>
                             S <= transport '0' after current;
                    When '1' => 
                             S <= transport '1' after current;
                    When 'x' =>
                             S <= transport 'x' after current;
                    when 'z' =>
                             S <= transport 'z' after current;
                    when others => 
                            current:=current - period;
               End Case;
        end loop;
End assign_qits;
procedure save_qits (
          Signal S  : in Character   ;
          file_name :  String  
                      ) IS        
    file output_value_file : logic_data is
  "C:\Users\NSB\Documents\U\7\VHDL\Exercises\Codes\File Reading\Inverter Assigning\DATA_in.txt";
Begin
     File_Open(output_value_file,file_name,write_mode);
             WRITE(OUTput_value_file,S);
             file_close(output_value_file); 
End SAVE_qits;
Signal  a , b : qit ;
File OUTput_value_file :logic_data is "DATA_OUT.txt";
File input_value_file :logic_data is "DATA_IN.txt";
Begin
Save_qits( b , "DATA_OUT.txt" );
Assign_qits(a , "DATA.txt" , 5 ns );
b<= Not a ;
End Architecture;
End;
