tableextension 50302 "Customer Ext" extends Customer
{
    fields
    {
        field(50300; Username; Text[250])
        {
            Caption = 'Username';
            DataClassification = EndUserIdentifiableInformation;
            trigger OnValidate()
            Var
                Customer: Record Customer;
            begin
                Customer.SetRange("Username", Rec.Username);
                Customer.SetFilter("No.", '<>%1', "No.");
                If Customer.FindFirst() then
                    Error('The Username must be unique');
            end;
        }
        field(50301; Password; Text[100])
        {
            Caption = 'Password';
            DataClassification = EndUserIdentifiableInformation;
        }
    }

    local procedure SetUser(UserName: Text): Boolean
    begin
        SetRange(Rec."Username", UserName);
        exit(FindFirst());
    end;
}
