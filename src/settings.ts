/*
 *  Power BI Visualizations
 *
 *  Copyright (c) Microsoft Corporation
 *  All rights reserved.
 *  MIT License
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the ""Software""), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

"use strict";

import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;

export class VisualSettings extends DataViewObjectsParser {

      public FormatP      : FmpSettings = new FmpSettings(); 
      public Tooltip      : TtpSettings = new TtpSettings();
      public IDC          : IdcSettings = new IdcSettings();
      public Exp          : ExpSettings = new ExpSettings();
      public ETS          : EtsSettings = new EtsSettings();
      public ARIMA        : ArmSettings = new ArmSettings();
      public STLM         : StlSettings = new StlSettings();
      public TSLM         : TslSettings = new TslSettings();
      public NNETAR       : NntSettings = new NntSettings();
      }

  export class ArmSettings {
    public show           : boolean = false;
    public ForecastLength : string = "12";
    public AO             : number = 3;
    public dd             : number = 3;
    public MAO            : number = 2;
    public Alm            : boolean = false;
    public Ald            : boolean = false;
  }
  export class StlSettings {
    public show           : boolean = false;
    public ForecastLength : string = "12";
  }
  export class TslSettings {
    public show           : boolean = false;
    public ForecastLength : string = "12";
  }
  export class NntSettings {
    public show           : boolean = false;
    public ForecastLength : string = "12";
    public decay          : number = 1;
    public Nnd            : number = 3;
    public nnw            : number = 10;
  }

  export class EtsSettings {
    public show           : boolean = true;
    public Error          : string = "Z";
    public Trend          : string = "Z";
    public Seasonal       : string = "Z";
    public ForecastLength : string = "12";

    
  }
  export class FmpSettings {
    public Title          : string = "Cash Flow Forecast";
    public Xaxis          : string = "Time";
    public Yaxis          : string = "Cash Flow value";
    public ColorO         : string = "#2600ff";
    public ColorP         : string = "#ff0000";
  }
  export class IdcSettings {
    public show            : boolean = false;
    public IC_color9       : string = "#8dbce9";
    public IC_color8       : string = "#b3b3b3";
  }
  export class ExpSettings {
    public Export         : boolean = false;
    public PExport        : string = "Saisir le chemin ";
  }
  export class TtpSettings {
    public TTitreP        : string = "Données prédites";
    public TTitreO        : string = "Données observés";
  }

   

