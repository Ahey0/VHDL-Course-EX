LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY save_example IS
END ENTITY;

ARCHITECTURE Behavior OF save_example IS
    -- Function to convert STD_LOGIC_VECTOR to a string
    FUNCTION to_string(vec : STD_LOGIC_VECTOR) RETURN STRING IS
        VARIABLE result : STRING(1 TO vec'LENGTH);
    BEGIN
        FOR i IN vec'RANGE LOOP
            IF vec(i) = '1' THEN
                result(i - vec'LOW + 1) := '1';
            ELSE
                result(i - vec'LOW + 1) := '0';
            END IF;
        END LOOP;
        RETURN result;
    END FUNCTION;

    -- Procedure to save data to a file
    PROCEDURE save_output_to_file (
        data      : IN  STD_LOGIC_VECTOR; -- Data to be saved
        file_name : IN  STRING            -- Name of the text file
    ) IS
        VARIABLE line_data : LINE;         -- Line buffer for file operations
        FILE output_file   : TEXT;         -- File handle
    BEGIN
        -- Open the file in write mode (creates or overwrites the file)
        FILE_OPEN(output_file, file_name, WRITE_MODE);

        -- Convert the STD_LOGIC_VECTOR to a string
        WRITE(line_data, to_string(data));

        -- Write the line buffer to the file
        WRITELINE(output_file, line_data);

        -- Close the file
        FILE_CLOSE(output_file);
    END save_output_to_file;

    -- Signal to hold output data
    SIGNAL output_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10101010"; -- Example data

BEGIN
    PROCESS
    BEGIN
        -- Call the procedure to save the signal to a text file
        save_output_to_file(output_data, 
            "C:/Users/NSB/Documents/U/7/VHDL/Exercises/Codes/File_Reading/SAVE_EXAMPLE/SAVEHERE.txt");

        WAIT; -- End simulation
    END PROCESS;
END ARCHITECTURE;
