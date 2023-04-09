# generated by fastapi-codegen:
#   filename:  ./openapi/bundled_openapi.yaml
#   timestamp: 2023-04-09T17:24:18+00:00

from __future__ import annotations

from datetime import datetime
from typing import Optional

from pydantic import BaseModel, Field


class AchivmentProperties(BaseModel):
    id: Optional[int] = None
    creator_id: Optional[int] = None
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None
    title: Optional[str] = None
    description: Optional[str] = None
    text_color: Optional[str] = '#FFFFFF'
    bg_color: Optional[str] = '#000000'


class CreateAchivment(AchivmentProperties):
    icon: bytes


class UpdateAchivment(AchivmentProperties):
    pass


class CreateOrganization(BaseModel):
    id: Optional[int] = None
    icon_link: Optional[str] = None
    login: str
    email: Optional[str] = None
    password: str = Field(
        ..., description='пароль организации', example='TestPassword12345'
    )


class Field0(BaseModel):
    id: Optional[int] = None
    icon_link: Optional[str] = None
    login: Optional[str] = None
    email: Optional[str] = None


class Achivment(AchivmentProperties):
    icon_link: Optional[str] = None


class RetrieveOrganization(Field0):
    pass


class UpdateOrganization(Field0):
    pass
