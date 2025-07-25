table 50125 Example
{
    DataClassification = CustomerContent;
    Caption = 'Example';
    LookupPageId = "Example List";
    DrillDownPageId = "Example List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; "Example Type Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Example Type Code';
            TableRelation = ExampleType;
        }
        field(4; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
    }

    keys
    {
        key(Pk; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert();
    begin
        if "No." = '' then begin
            ExampleSetup.Get();
            ExampleSetup.TestField("Example Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Example Nos.",
                                        xRec."No. Series",
                                        0D,
                                        "No.",
                                        "No. Series");
        end;
    end;

    procedure AssistEdit(OldExample: Record Example): Boolean
    var
        Example: Record Example;
    begin
        Example := Rec;
        ExampleSetup.Get();
        ExampleSetup.TestField("Example Nos.");
        if NoSeriesManagement.SelectSeries(ExampleSetup."Example Nos.",
                                        OldExample."No. Series",
                                        Example."No. Series") then begin
            NoSeriesManagement.SetSeries(Example."No.");
            Rec := Example;
            exit(true);
        end;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExampleSetup: Record "Example Setup";
}