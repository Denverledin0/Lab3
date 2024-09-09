#!/bin/bash
BAROMETRE_ADDRESS=0x76
MPU_ADDRESS=0x68
I2C_BUS=2
BAROMETRE_REGISTER=0xD0
MPU_REGISTER=0x00
BAROMETRE_EXPECTED=0x58
MPU_EXPECTED=0xbd

read_value=$(i2cget -f -y $I2C_BUS $BAROMETRE_ADDRESS $BAROMETRE_REGISTER)
read_value=$(echo $read_value | sed 's/^0x//')

if [ "$read_value" == "$(printf '%x' $BAROMETRE_EXPECTED)" ]; then
    echo "Le registre $BAROMETRE_REGISTER contient bien la valeur attendue : $BAROMETRE_EXPECTED"
else
    echo "Erreur : le registre $BAROMETRE_REGISTER contient $read_value au lieu de $BAROMETRE_EXPECTED"
fi

read_value=$(i2cget -f -y $I2C_BUS $MPU_ADDRESS $MPU_REGISTER)
read_value=$(echo $read_value | sed 's/^0x//')

if [ "$read_value" == "$(printf '%x' $MPU_EXPECTED)" ]; then
    echo "Le registre $MPU_REGISTER contient bien la valeur attendue : $MPU_EXPECTED"
else
    echo "Erreur : le registre $MPU_REGISTER contient $read_value au lieu de $MPU_EXPECTED"
fi

