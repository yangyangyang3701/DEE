# Document-Level Event Extraction

This repository contains the code and data for the paper titled "**LAAP: Learning the Argument of an Entity with Event Prompts for Document-Level Event Extraction**."

The paper presents a novel method, LAAP, designed for document-level event extraction. LAAP introduces event prompts for event type detection, using sentence placeholders to effectively elicit event-specific information. Additionally, it proposes a strategy for learning the argument of an entity, progressively narrowing down entity types to identify the most suitable match.

This README provides an overview of the repository, along with instructions for running the code and using the data.

## Installation

Clone the repository:

```bash
git clone https://github.com/yangyangyang3701/DEE.git
```

### Requirements

To run the code, ensure you have the following dependencies:

- Python 3.7+
- Torch 1.7+

Install all dependencies using pip:

```shell
pip install -r requirements.txt
```

## Data

The data used in this project is located in the `Data/` directory. The repository includes multiple datasets, such as ChFinAnn and DuEE-fin.

- **ChFinAnn Dataset:** [Download Here](https://github.com/dolphin-zs/Doc2EDAG)
- **DuEE-fin Dataset:** [Download Here](https://aistudio.baidu.com/aistudio/competition/detail/65)
- **RAMS Dataset:** [Download Here](https://nlp.jhu.edu/rams/)
- **WikiEvents Dataset:** [Download Here](https://github.com/raspberryice/gen-arg)

## Usage

### Data Preprocessing

For the ChFinAnn dataset, generate data with document types (o2o, o2m, m2m) for better evaluation:

```bash
cd Data/ChFinAnn
python stat.py
```

For the DuEE-fin dataset:

```bash
cd Data/DuEE
python build_data.py
```

For WikiEvents  dataset:

```bash
cd Data/WikiEvents
python build_data.py
```

### Training

To train the model on the ChFinAnn dataset:

```bash
bash training/run_laap.sh
```

To train on the DuEE-fin dataset without annotated triggers:

```bash
bash training/run_laap_dueefin_woTgg.sh
```

## Project Foundation and Code References

This project is built on the foundation of [Doc2EDAG](https://github.com/shun-zheng/Doc2EDAG) and references the following repositories:

1. [Doc2EDAG](https://github.com/shun-zheng/Doc2EDAG)
2. [DocEE](https://github.com/Spico197/DocEE)
3. [DuEE](https://github.com/zhoujx4/DuEE)

## License

This project is licensed under the MIT License.
