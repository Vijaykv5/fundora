import { NextApiRequest, NextApiResponse } from "next";
import { NextResponse } from "next/server";
import  prisma  from "@/app/lib/db"; // Adjust path based on your structure

export async function POST(request: Request) {
  try {
    const { name, email } = await request.json();

    // Save the form data to the database using Prisma
    const newuser = await prisma.user.create({
      data: {
        name,
        email,
      },
    });

    // Return the created user as a response
    return NextResponse.json(newuser, { status: 200 });
  } catch (error) {
    console.error("Error creating user:", error);
    return NextResponse.json(
      { error: "Failed to create user" },
      { status: 500 }
    );
  }
}

// export const  GET = async (request: Request) => {
// console.log("GET request received");

// }