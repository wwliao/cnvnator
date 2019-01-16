## CNVnator Docker Image

### Run CNVnator on local machine

1. Pull CNVnator docker image

    ```
    docker pull wwliao/cnvnator
    ```

2. Extracting read mapping from BAM/SAM files

    ```
    docker run -v /path/to/workplace:/data wwliao/cnvnator cnvnator -unique -root out.root -tree input.bam
    ```

3. Generating a histogram

    ```
    docker run -v /path/to/workplace:/data wwliao/cnvnator cnvnator -root out.root -his 500 -d /path/to/chrom/seqs
    ```

4. Calculating statistics

    ```
    docker run -v /path/to/workplace:/data wwliao/cnvnator cnvnator -root out.root -stat 500
    ```

5. RD signal partitioning

    ```
    docker run -v /path/to/workplace:/data wwliao/cnvnator cnvnator -root out.root -partition 500
    ```

6. CNV calling

    ```
    docker run -v /path/to/workplace:/data wwliao/cnvnator cnvnator -root out.root -call 500 > out.call.txt
    ```

### Run CNVnator on LSF cluster

1. Extracting read mapping from BAM/SAM files

    ```
    LSF_DOCKER_PRESERVE_ENVIRONMENT=false LSF_DOCKER_VOLUMES="/path/to/workplace:/data" bsub -q research-hpc -a "docker(wwliao/cnvnator)" cnvnator -unique -root out.root -tree input.bam
    ```

2. Generating a histogram

    ```
    LSF_DOCKER_PRESERVE_ENVIRONMENT=false LSF_DOCKER_VOLUMES="/path/to/workplace:/data" bsub -q research-hpc -a "docker(wwliao/cnvnator)" cnvnator -root out.root -his 500 -d /path/to/chrom/seqs
    ```

3. Calculating statistics

    ```
    LSF_DOCKER_PRESERVE_ENVIRONMENT=false LSF_DOCKER_VOLUMES="/path/to/workplace:/data" bsub -q research-hpc -a "docker(wwliao/cnvnator)" cnvnator -root out.root -stat 500
    ```

4. RD signal partitioning

    ```
    LSF_DOCKER_PRESERVE_ENVIRONMENT=false LSF_DOCKER_VOLUMES="/path/to/workplace:/data" bsub -q research-hpc -a "docker(wwliao/cnvnator)" cnvnator -root out.root -partition 500
    ```

5. CNV calling

    ```
    LSF_DOCKER_PRESERVE_ENVIRONMENT=false LSF_DOCKER_VOLUMES="/path/to/workplace:/data" bsub -q research-hpc -oo out.call.txt -a "docker(wwliao/cnvnator)" cnvnator -root out.root -call 500
    ```

