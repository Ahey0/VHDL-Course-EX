Library IEEE;
USE IEEE.STD_LOGIC_1164.All;
USE work.basic_utilities.All;
Entity test_of_file_reading is
end entity;
Architecture test_of_file_reading_behave of test_of_file_reading is
procedure assign_bits (
          Signal S  : OUT BIT   ;
          file_name : In String ;
          period    : In Time   
                      ) IS
    Variable char    : Character    ;         
    Variable current : Time := 0 ns ;
    file input_value_file : logic_data is "C:\Modeltech_5.5e\examples\work\test_of_file_reading/DATA.txt";
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
End assign_bits;
File input_value_file :logic_data is "DATA.txt";
Signal a , b , c : bit ;
begin
Assign_bits(a , "DATA.txt" , 50 ns );
End;




