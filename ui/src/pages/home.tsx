import * as React from "react";
import { Card } from "../components/card";

export const HomePage = () => {
  console.log("process.env.HELLO", process.env.HELLO);
  return (
    <div>
      <Card variant="task" />
    </div>
  );
};
