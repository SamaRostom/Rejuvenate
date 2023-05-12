from dataclasses import dataclass
from typing import Any, List, TypeVar, Callable, Type, cast


T = TypeVar("T")


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


@dataclass
class FileAttributes:
    pass

    @staticmethod
    def from_dict(obj: Any) -> 'FileAttributes':
        assert isinstance(obj, dict)
        return FileAttributes()

    def to_dict(self) -> dict:
        result: dict = {}
        return result


@dataclass
class RegionAttributes:
    label: str

    @staticmethod
    def from_dict(obj: Any) -> 'RegionAttributes':
        assert isinstance(obj, dict)
        label = from_str(obj.get("label"))
        return RegionAttributes(label)

    def to_dict(self) -> dict:
        result: dict = {}
        result["label"] = from_str(self.label)
        return result


@dataclass
class ShapeAttributes:
    name: str
    all_points_x: List[float]
    all_points_y: List[float]

    @staticmethod
    def from_dict(obj: Any) -> 'ShapeAttributes':
        assert isinstance(obj, dict)
        name = from_str(obj.get("name"))
        all_points_x = from_list(from_float, obj.get("all_points_x"))
        all_points_y = from_list(from_float, obj.get("all_points_y"))
        return ShapeAttributes(name, all_points_x, all_points_y)

    def to_dict(self) -> dict:
        result: dict = {}
        result["name"] = from_str(self.name)
        result["all_points_x"] = from_list(to_float, self.all_points_x)
        result["all_points_y"] = from_list(to_float, self.all_points_y)
        return result


@dataclass
class The0:
    shape_attributes: ShapeAttributes
    region_attributes: RegionAttributes

    @staticmethod
    def from_dict(obj: Any) -> 'The0':
        assert isinstance(obj, dict)
        shape_attributes = ShapeAttributes.from_dict(obj.get("shape_attributes"))
        region_attributes = RegionAttributes.from_dict(obj.get("region_attributes"))
        return The0(shape_attributes, region_attributes)

    def to_dict(self) -> dict:
        result: dict = {}
        result["shape_attributes"] = to_class(ShapeAttributes, self.shape_attributes)
        result["region_attributes"] = to_class(RegionAttributes, self.region_attributes)
        return result


@dataclass
class Regions:
    the_0: The0

    @staticmethod
    def from_dict(obj: Any) -> 'Regions':
        assert isinstance(obj, dict)
        the_0 = The0.from_dict(obj.get("0"))
        return Regions(the_0)

    def to_dict(self) -> dict:
        result: dict = {}
        result["0"] = to_class(The0, self.the_0)
        return result


@dataclass
class Jpg:
    fileref: str
    size: int
    filename: str
    base64_img_data: str
    file_attributes: FileAttributes
    regions: Regions

    @staticmethod
    def from_dict(obj: Any) -> 'Jpg':
        assert isinstance(obj, dict)
        fileref = from_str(obj.get("fileref"))
        size = from_int(obj.get("size"))
        filename = from_str(obj.get("filename"))
        base64_img_data = from_str(obj.get("base64_img_data"))
        file_attributes = FileAttributes.from_dict(obj.get("file_attributes"))
        regions = Regions.from_dict(obj.get("regions"))
        return Jpg(fileref, size, filename, base64_img_data, file_attributes, regions)

    def to_dict(self) -> dict:
        result: dict = {}
        result["fileref"] = from_str(self.fileref)
        result["size"] = from_int(self.size)
        result["filename"] = from_str(self.filename)
        result["base64_img_data"] = from_str(self.base64_img_data)
        result["file_attributes"] = to_class(FileAttributes, self.file_attributes)
        result["regions"] = to_class(Regions, self.regions)
        return result


@dataclass
class Data:
    jpg: List[Jpg]

    @staticmethod
    def from_dict(obj: Any) -> 'Data':
        assert isinstance(obj, dict)
        jpg = from_list(Jpg.from_dict, obj.get("jpg"))
        return Data(jpg)

    def to_dict(self) -> dict:
        result: dict = {}
        result["jpg"] = from_list(lambda x: to_class(Jpg, x), self.jpg)
        return result


def data_from_dict(s: Any) -> Data:
    return Data.from_dict(s)


def data_to_dict(x: Data) -> Any:
    return to_class(Data, x)
