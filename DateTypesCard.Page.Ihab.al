/// <summary>
/// Page IhabDateTypesCard (ID 50800).
/// </summary>
page 50810 DateTypesCard
{
    Caption = 'Date Type Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    //SourceTable = TableName;



    var
        LoopNo: Integer;

    var
        YesOrNo: Boolean;

    var
        Amount: Decimal;

    var
        "When Was It": Date;

    var
        "What Time": Time;

    var
        Description: Text[30];

    var
        "Code Number": Code[10];

    var
        Ch: Char;

    var
        Color: Option Red,Orange,Yellow,Green,Blue,Violet;

    /// <summary>
    /// UglyCode.
    /// </summary>
    #region Ugly code - let's not look at this
    procedure UglyCode()
    begin
        // No one should look at this
    end;
    #endregion


    trigger OnOpenPage()
    begin
        Message('The value of %1 is %2', 'YesOrNo', YesOrNo);
        Message('The value of %1 is %2', 'Amount', Amount);
        Message('The value of %1 is %2', 'When Was It', "When Was It");
        Message('The value of %1 is %2', 'What Time', "What Time");
        Message('The value of %1 is %2', 'Description', Description);
        Message('The value of %1 is %2', 'Code Number', "Code Number");
        Message('The value of %1 is %2', 'Ch', Ch);
        Message('The value of %1 is %2', 'Color', Color);

    end;





}