{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvPerforated.PAS, released on 2001-02-28.

The Initial Developer of the Original Code is Sébastien Buysse [sbuysse@buypin.com]
Portions created by Sébastien Buysse are Copyright (C) 2001 Sébastien Buysse.
All Rights Reserved.

Contributor(s): Michael Beck [mbeck@bigfoot.com].

Last Modified: 2000-02-28

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I JVCL.INC}

unit JvPerforated;



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ExtCtrls, JvComponent;

type
  TJvPerforated = class(TJvCustomPanel)
  private
    FHandle: THandle;
    FForm: TCustomForm;
    FLeft: Integer;
    FTop: Integer;
    FWidth: Integer;
    FHeight: Integer;
    FX: Integer;
    FY: Integer;
    FTransparent: Boolean;
    procedure SetTransparent(Value: Boolean);
    procedure WMMove(var Msg: TWMMove); message WM_MOVE;
    function FormPosSizeChange(var Msg: TMessage): Boolean;
  protected
  public
    procedure Resize; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Transparent: Boolean read FTransparent write SetTransparent default False;
  end;

implementation

uses
  JvWndProcHook;

{*******************************************************}

constructor TJvPerforated.Create(AOwner: TComponent);
begin
  inherited;
  FTransparent := False;
  FForm := GetParentForm(TControl(AOwner));
  FHandle := FForm.Handle;
  FWidth := FForm.Width;
  FHeight := FForm.Height;
  FLeft := FForm.Left;
  FTop := FForm.Top;
  FY := FForm.Height - FForm.ClientHeight + 2;
  FX := FForm.Width - FForm.ClientWidth + 2;
  BorderWidth := 0;
  BevelInner := bvNone;
  BevelOuter := bvNone;
  RegisterWndProcHook(FForm, FormPosSizeChange, hoAfterMsg);
end;

{*******************************************************}

destructor TJvPerforated.Destroy;
begin
  if not (csDestroying in FForm.ComponentState) then
    SetTransparent(False);
  inherited;
end;

{*******************************************************}

procedure TJvPerforated.Resize;
begin
  inherited;
  SetTransparent(FTransparent);
end;

{*******************************************************}

procedure TJvPerforated.WMMove(var Msg: TWMMove);
begin
  inherited;
  SetTransparent(FTransparent);
end;

{*******************************************************}

function TJvPerforated.FormPosSizeChange(var Msg: TMessage): Boolean;
begin
  if (Msg.Msg = WM_MOVE) or (Msg.Msg = WM_SIZE) then
    SetTransparent(FTransparent);
end;

{*******************************************************}

procedure TJvPerforated.SetTransparent(Value: Boolean);
var
  WindowRgn, HoleRgn: HRGN;
begin
  FTransparent := Value;
  if Value then
  begin
    FWidth := FForm.Width;
    FHeight := FForm.Height;
    FLeft := FForm.Left;
    FTop := FForm.Top;
    FY := FForm.ClientHeight - FForm.Height;
    FX := FForm.ClientWidth - FForm.Width;

    WindowRgn := 0;
    GetWindowRgn(FHandle, WindowRgn);
    DeleteObject(WindowRgn);

    WindowRgn := CreateRectRgn(0, 0, FWidth, FHeight);
    HoleRgn := CreateRectRgn(Left - FX - 3, Top - FY - 3, (Left - FX) + Width - 3, (Top - FY) + Height - 3);
    CombineRgn(WindowRgn, WindowRgn, HoleRgn, RGN_DIFF);
    SetWindowRgn(FHandle, WindowRgn, True);

    DeleteObject(HoleRgn);
  end
  else
  begin
    WindowRgn := 0;
    SetWindowRgn(FHandle, WindowRgn, True);
  end;
end;

end.
