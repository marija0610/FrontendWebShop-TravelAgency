table 50302 "Web Service Setup"
{
    Caption = 'Web Service Setup';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'PrimaryKey';
            DataClassification = SystemMetadata;
        }
        field(2; "Base Url"; Text[250])
        {
            Caption = 'Base Url';
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(3; UserName; Text[100])
        {
            Caption = 'UserName';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(4; Password; Text[100])
        {
            Caption = 'Password';
            DataClassification = EndUserIdentifiableInformation;
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

