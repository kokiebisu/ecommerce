import * as React from "react";
import { TaskCard } from "./card-task";

export type CardProps = {
  variant: "task";
};

export const Card = (props: CardProps) => {
  switch (props.variant) {
    case "task":
      return <TaskCard />;
    default:
      throw new Error(`Invalid variant provided`);
  }
};
