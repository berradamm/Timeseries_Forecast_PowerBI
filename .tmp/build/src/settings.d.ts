import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;
export declare class VisualSettings extends DataViewObjectsParser {
    FormatP: FmpSettings;
    Tooltip: TtpSettings;
    IDC: IdcSettings;
    Exp: ExpSettings;
    ETS: EtsSettings;
    ARIMA: ArmSettings;
    STLM: StlSettings;
    TSLM: TslSettings;
    NNETAR: NntSettings;
}
export declare class ArmSettings {
    show: boolean;
    ForecastLength: string;
    AO: number;
    dd: number;
    MAO: number;
    Alm: boolean;
    Ald: boolean;
}
export declare class StlSettings {
    show: boolean;
    ForecastLength: string;
}
export declare class TslSettings {
    show: boolean;
    ForecastLength: string;
}
export declare class NntSettings {
    show: boolean;
    ForecastLength: string;
    decay: number;
    Nnd: number;
    nnw: number;
}
export declare class EtsSettings {
    show: boolean;
    Error: string;
    Trend: string;
    Seasonal: string;
    ForecastLength: string;
}
export declare class FmpSettings {
    Title: string;
    Xaxis: string;
    Yaxis: string;
    ColorO: string;
    ColorP: string;
}
export declare class IdcSettings {
    show: boolean;
    IC_color9: string;
    IC_color8: string;
}
export declare class ExpSettings {
    Export: boolean;
    PExport: string;
}
export declare class TtpSettings {
    TTitreP: string;
    TTitreO: string;
}
