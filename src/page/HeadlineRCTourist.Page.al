page 50306 "Headline RC Tourist"
{
    Caption = 'Headline RC Tourist';
    PageType = HeadlinePart;

    layout
    {
        area(content)
        {
            group(Control)
            {
                ShowCaption = false;
                field(quesetion; GetQuestion())
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Question Headline';
                    Editable = false;
                    Style = StrongAccent;
                }
            }
        }
    }


    local procedure GetQuestion(): Text
    var
        String: Text[100];
    begin
        String := '✈ So you want to travel? Find the best destination! 🗺';
        exit(String);
    end;
}
