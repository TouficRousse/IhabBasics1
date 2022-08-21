/// <summary>
/// Page IhabExpressionCardPage (ID 50801).
/// </summary>
page 50811 ExpressionCardPage
{
    Caption = 'Expression Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(input)
            {
                Caption = 'Input';
                field(value1; value1)
                {
                    Caption = 'value1';
                    ApplicationArea = All;
                }
                field(value2; value2)
                {
                    Caption = 'value2';
                    ApplicationArea = All;
                }
            }
            group(output)
            {
                Caption = 'Test';
                field(result; result)
                {
                    Caption = 'Result';
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                Caption = 'Execute';
                Image = ExecuteAndPostBatch;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    result := value1 > value2;
                end;
            }
        }
    }

    var
        value1, value2 : Integer;

    var
        result: Boolean;
}