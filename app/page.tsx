// import Image from "next/image";
// import prisma from "./lib/db";
'use client'

import { Form } from "./Form";


export default function Home() {


  
  // const users =prisma.user.findMany();
  // console.log(users)

  return (
    <>
  <h1>
    <Form/>
  </h1>
   
    </>
  );
}
