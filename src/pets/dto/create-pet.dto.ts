import { ApiProperty } from '@nestjs/swagger';
import * as validator from 'class-validator';

export class CreatePetDto {
  @ApiProperty()
  @validator.IsString()
  @validator.IsNotEmpty()
  @validator.MinLength(3)
  name: string;

  @validator.IsNumber()
  @validator.IsNotEmpty()
  @ApiProperty()
  ownerId: number;
}
