table 50127 ExampleHeader
{
    DataClassification = CustomerContent;
    Caption = 'Example Header';
    LookupPageId = "Example Document List";
    DrillDownPageId = "Example Document List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Date';
        }
        field(3; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
        }
        field(5; "No. Printed"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No. Printed';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        ExampleSetup: Record "Example Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            ExampleSetup.Get();
            ExampleSetup.TestField("Document Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Document Nos.",
                                        xRec."No. Series",
                                        0D,
                                        "No.",
                                        "No. Series");
        end;
        InitRecord();
    end;

    procedure AssistEdit(OldExampleHeader: Record "ExampleHeader"): Boolean
    var
        ExampleHeader: Record "ExampleHeader";
    begin
        ExampleHeader := Rec;
        ExampleSetup.Get();
        ExampleSetup.TestField("Document Nos.");
        if NoSeriesManagement.SelectSeries(ExampleSetup."Document Nos.",
                                        OldExampleHeader."No. Series",
                                        ExampleHeader."No. Series") then begin
            NoSeriesManagement.SetSeries(ExampleHeader."No.");
            Rec := ExampleHeader;
            exit(true);
        end;
    end;

    procedure InitRecord()
    begin
        if Rec."Posting Date" = 0D then
            Rec."Posting Date" := WorkDate();
        Rec."Document Date" := WorkDate();
    end;
}