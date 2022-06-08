table 50300 "TouristActivity"
{
    Caption = 'Tourist Activity';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'PrimaryKey';
            DataClassification = SystemMetadata;
        }

        field(2; "Offers in Greece"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Item where("Item Category Code" = const('ARRANGEMENT'),
                                            "Country" = const('Greece')));
        }

        field(3; "Offers in Spain"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Item where("Item Category Code" = const('ARRANGEMENT'),
                                            "Country" = const('Spain')));
        }
        field(4; "Offers in Italy"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Item where("Item Category Code" = const('ARRANGEMENT'),
                                            "Country" = const('Italy')));
        }

        field(5; "Offers in Croatia"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Item where("Item Category Code" = const('ARRANGEMENT'),
                                            "Country" = const('Croatia')));
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
