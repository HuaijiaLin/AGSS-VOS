name=ft_davis
echo $name
tgt_dir=Outputs/$name
if [ ! -d $tgt_dir ]; then
	mkdir -p $tgt_dir
fi
python3 train_davis.py \
	--root-data='data/davis2017/trainval' \
	--root-all-data='data/davis2017/trainval' \
	--meta-list='data/davis2017/trainval/train_meta.json' \
	--restore='checkpoints/train_ytv/model_4.pth' \
	--finetune \
	--epoch=100 \
	--random-ref \
	--random-crop \
	--lr-atn \
	--loss-iou-maxmin \
	--batch-size=1 \
	--start-epoch=0 \
	--sample-size=8 \
	--lr=1e-6 \
	--gpu='3' \
	--sample-dir=$tgt_dir'/sample' \
	--snapshot-dir=$tgt_dir'/snapshot' \
	--fix-lr=0 \
	2>&1 | tee $tgt_dir/train.log
