page 50301 "TouristActivity"
{
    Caption = 'Tourist Activity';
    PageType = CardPart;
    SourceTable = TouristActivity;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;
                cuegroup(Group)
                {
                    Caption = 'Tourist offers in different countries';
                    field(Field1; Rec."Offers in Greece")
                    {
                        ApplicationArea = All;
                        Caption = 'Greece 🌴';
                        Image = Camera;
                        Style = AttentionAccent;
                        ToolTip = 'Specifies the value of the Offers in Greece field.';

                    }
                    field(Field2; Rec."Offers in Spain")
                    {
                        ApplicationArea = All;
                        Caption = 'Spain 💃🏻';
                        Image = Camera;
                        Style = AttentionAccent;
                        ToolTip = 'Specifies the value of the Offers in Spain field.';
                    }

                    field(Field3; Rec."Offers in Italy")
                    {
                        ApplicationArea = All;
                        Caption = 'Italy 🍕';
                        Image = Camera;
                        Style = AttentionAccent;
                        ToolTip = 'Specifies the value of the Offers in Italy field.';
                    }

                    field(Field4; Rec."Offers in Croatia")
                    {
                        ApplicationArea = All;
                        Caption = 'Croatia ⛵';
                        Image = Camera;
                        Style = AttentionAccent;
                        ToolTip = 'Specifies the value of the Offers in Croatia field.';
                    }
                }

            }
        }

    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
    end;

}
