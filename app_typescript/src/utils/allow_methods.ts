import { Request, Response } from "express";

type Method = (
    'CONNECT' |
    'DELETE' |
    'GET' |
    'HEAD' |
    'OPTIONS' |
    'PATCH' |
    'POST' |
    'PUT' |
    'TRACE'
)


const allow_methods = (methods: Method[]) => {
  return (req: Request, res: Response) => res
    .status(405)
    .header("Allow", methods.join(", "))
    .send();
};

export default allow_methods;
