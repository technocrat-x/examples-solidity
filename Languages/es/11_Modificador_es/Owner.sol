// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Owner {
   address public owner; // define la variable owner

   // constructor
   constructor() {
      owner = msg.sender; //Asigna la la dirección del usuario que despliega el contrato como owner 
   }

   // define modifier
   modifier onlyOwner {
      require(msg.sender == owner); // verifica si la dirección que ejecuta la función es la dirección del propietario
      _; // si es verdadero, continúa ejecutando el cuerpo de la función; de lo contrario, lanza un error y revierte la transacción
   }

   // define una función con el modificador onlyOwner
   function changeOwner(address _newOwner) external onlyOwner{
      owner = _newOwner; // solo la dirección del propietario puede ejecutar esta función y cambiar el propietario
   }
}