
page 50305 "Web Service Setup"
{
    Caption = 'Web Service Setup';
    PageType = Card;
    SourceTable = "Web Service Setup";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Base Url"; Rec."Base Url")
                {
                    ToolTip = 'Specifies the value of the Base Url field.';
                    ApplicationArea = All;
                }
                field(UserName; Rec.UserName)
                {
                    ToolTip = 'Specifies the value of the UserName field.';
                    ApplicationArea = All;
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.';
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        If not Rec.FindFirst() then begin
            Rec.Init();
            Rec."Base Url" := GetBaseURL();
            Rec.Insert();
        end;
    end;

    local procedure GetBaseURL(): Text[250]
    begin
        exit('http://betsandbox.westeurope.cloudapp.azure.com:7048/E1/api/v2.0');
    end;

}
