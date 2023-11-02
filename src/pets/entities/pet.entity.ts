import { Pet } from '@prisma/client';
import { ApiProperty } from '@nestjs/swagger';

export class PetEntity implements Pet {
  @ApiProperty()
  id: number;

  @ApiProperty()
  name: string;

  @ApiProperty()
  ownerId: number;

  @ApiProperty()
  characteristicId: number;
}
