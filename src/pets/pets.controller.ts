import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  ParseIntPipe,
  NotFoundException,
} from '@nestjs/common';
import { PetsService } from './pets.service';
import { CreatePetDto } from './dto/create-pet.dto';
import { UpdatePetDto } from './dto/update-pet.dto';
import { ApiCreatedResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { PetEntity } from './entities/pet.entity';

@Controller('pets')
@ApiTags('pets')
export class PetsController {
  constructor(private readonly petsService: PetsService) {}

  @Post()
  @ApiCreatedResponse({ type: PetEntity })
  create(@Body() createPetDto: CreatePetDto) {
    return this.petsService.create(createPetDto);
  }

  @Get()
  @ApiOkResponse({ type: PetEntity, isArray: true })
  findAll() {
    return this.petsService.findAll();
  }

  @Get(':id')
  @ApiOkResponse({ type: PetEntity })
  async findOne(@Param('id', ParseIntPipe) id: string) {
    const pet = await this.petsService.findOne(+id);

    if (!pet) {
      throw new NotFoundException(`Pet with ${id} does not exist.`);
    }

    return pet;
  }

  @Patch(':id')
  @ApiOkResponse({ type: PetEntity })
  update(
    @Param('id', ParseIntPipe) id: string,
    @Body() updatePetDto: UpdatePetDto,
  ) {
    return this.petsService.update(+id, updatePetDto);
  }

  @Delete(':id')
  @ApiOkResponse({ type: PetEntity })
  remove(@Param('id', ParseIntPipe) id: string) {
    return this.petsService.remove(+id);
  }
}
