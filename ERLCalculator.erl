main(_) ->
    io:format("Enter the first number: "),
    Num1String = io:get_line(""),
    Num1 = list_to_number(string:trim(Num1String)),
    Num1Float = ensure_float(Num1),
    
    io:format("Choose between:\n1) Addition\n2) Subtraction\n3) Multiplication\n4) Division\n: "),
    CalculationTypeString = io:get_line(""),
    CalculationType = list_to_integer(string:trim(CalculationTypeString)),
    
    io:format("Enter the second number: "),
    Num2String = io:get_line(""),
    Num2 = list_to_number(string:trim(Num2String)),
    Num2Float = ensure_float(Num2),

    Result = case CalculationType of
        1 -> Num1Float + Num2Float;
        2 -> Num1Float - Num2Float;
        3 -> Num1Float * Num2Float;
        4 -> Num1Float / Num2Float;
        _ -> io:format("Invalid function.")
    end,
    
    io:format("The result is: ~p", [Result]).

ensure_float(Number) ->
    case is_integer(Number) of
        true -> float(Number);
        false -> Number
    end.

list_to_number(NumberString) ->
    try list_to_integer(NumberString)
    catch
        error:badarg ->
            list_to_float(NumberString)
    end.
