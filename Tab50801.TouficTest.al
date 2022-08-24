table 50801 "Toufic Test"
{
    Caption = 'Toufic Test';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; int; Integer)
        {
            Caption = 'int';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; int)
        {
            Clustered = true;
        }
    }
}
