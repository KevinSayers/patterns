# Process per file output 

## Problem 

A task in your workflow produces two or more files at time. A downstream task needs to process each
of these files independently.

## Solution

Use the [flatten](https://www.nextflow.io/docs/latest/operator.html#flatten) operator to 
transform the outputs of the upstream process to a channel emitting each file separately. 
Then use this channel as input for the tdownstream process. 


# Code 

```nextflow

process foo {
  output:
  file '*.txt' into foo_ch 
  script:
  '''
  echo Hello there! > file1.txt
  echo What a beautiful day > file2.txt
  echo I wish you are having fun1 > file3.txt 
  ''' 
}

process foo {
  input: 
  file x from foo_ch.flatten()
  script:
  """
  cat $x
  """
}
```

## Run it

Use the the following command to execute the example:

    nextflow run main.nf

