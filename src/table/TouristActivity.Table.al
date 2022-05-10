table 50300 "TouristActivity"
{
    Caption = 'TouristActivity';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'PrimaryKey';
            DataClassification = SystemMetadata;
        }
        field(2; "No. of Customers"; Integer)
        {
            Caption = 'No. of Tourists';
            FieldClass = FlowField;
            CalcFormula = count(Customer);
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
}
