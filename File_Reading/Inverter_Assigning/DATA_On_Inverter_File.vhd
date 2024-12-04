Library IEEE;
use IEEE.std_Logic_1164.all;
Use work.basic_utilities.all;
Entity DATA_On_Inverter_File Is
END ENTITY;
Architecture DATA_On_Inverter_File_Behave OF DATA_On_Inverter_File  IS
procedure assign_bits (
          Signal S  : OUT BIT   ;
          file_name : In String ;
          period    : In Time   
                      ) IS
    Variable char    : Character    ;         
    Variable current : Time := 0 ns ;
    file input_value_file : logic_data is 
"C:\Users\NSB\Documents\U\7\VHDL\Exercises\Codes\File_Reading\Inverter_Assigning\DATA_OUT.txt";
Begin
     File_Open(input_value_file,file_name,READ_MODE);
While Not ENDFILE (input_value_file) Loop
             Read (input_value_file,char);
             If char='0' or char='1' then 
                current:=current + period;
                IF Char ='0' Then 
                   S <= transport '0' after current;
                elsif CHAR = '1' then 
                   S <= transport '1' after current;
                End if;
              End if;
        end loop;
file_close(input_value_file);
End assign_bits;
procedure save_bits (
          Signal S  : in bit   ;
          file_name :  in String  
                      ) IS        
    Variable Char : Character;
    file output_value_file : logic_data is
  "C:\Users\NSB\Documents\U\7\VHDL\Exercises\Codes\File_Reading\Inverter_Assigning\DATA_in.txt";
Begin
     File_Open(output_value_file,file_name,write_mode);
            if s = '0' then 
               Char := '0' ;
            else 
               char := '1' ;
end if;
     WRITE (OUTput_value_file,Char);
             file_close(output_value_file); 
End SAVE_bits;
Signal  a , b : bit ;
File OUTput_value_file :logic_data is "DATA_OUT.txt";
File input_value_file :logic_data is "DATA_IN.txt";
Begin
--save_bits( b , "DATA_OUT.txt" );
Assign_bits(a , "DATA.txt" , 5 ns );
b<= Not a ;

End Architecture;
